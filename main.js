const { app, BrowserWindow, shell, session } = require("electron");

const APP_URL = "https://kotzschfelix-sudo.github.io/Scantest/";
const APP_ORIGIN = new URL(APP_URL).origin;

function createWindow() {
  const win = new BrowserWindow({
    width: 1440,
    height: 940,
    minWidth: 900,
    minHeight: 650,
    title: "Schullager",
    autoHideMenuBar: true,
    backgroundColor: "#101827",
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
      sandbox: true
    }
  });

  win.webContents.setWindowOpenHandler(({ url }) => {
    if (url.startsWith("https://") && new URL(url).origin !== APP_ORIGIN) {
      shell.openExternal(url);
    }
    return { action: "deny" };
  });

  win.webContents.on("will-navigate", (event, url) => {
    try {
      if (new URL(url).origin !== APP_ORIGIN) {
        event.preventDefault();
        if (url.startsWith("https://")) shell.openExternal(url);
      }
    } catch {
      event.preventDefault();
    }
  });

  win.loadURL(APP_URL);
}

app.whenReady().then(() => {
  app.setAppUserModelId("de.schullager.desktop");

  // Allow the HTTPS Schullager website to use the camera for barcode scanning.
  session.defaultSession.setPermissionRequestHandler((webContents, permission, callback) => {
    let allowedOrigin = false;
    try {
      allowedOrigin = new URL(webContents.getURL()).origin === APP_ORIGIN;
    } catch {}
    callback(allowedOrigin && permission === "media");
  });

  createWindow();
  app.on("activate", () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on("window-all-closed", () => {
  if (process.platform !== "darwin") app.quit();
});
