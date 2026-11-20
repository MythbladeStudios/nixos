{ ... }:

let
  browser = "librewolf.desktop";
  filemanager = "dev.noctalia.luciole.desktop";
  texteditor = "org.gnome.TextEditor.desktop";
  imageviewer = "org.gnome.Loupe.desktop";
  videoplayer = "io.github.diegopvlk.Cine.desktop";
  audioplayer = "org.gnome.Decibels.desktop";
  pdfviewer = "org.gnome.Papers.desktop";
in

{
  xdg.mime.defaultApplications = {
    "text/html" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;

    "inode/directory" = filemanager;

    "application/json" = texteditor;
    "application/toml" = texteditor;
    "text/plain" = texteditor;

    "image/gif" = imageviewer;
    "image/jpeg" = imageviewer;
    "image/png" = imageviewer;

    "video/mp4" = videoplayer;
    "video/x-matroska" = videoplayer;

    "audio/flac" = audioplayer;
    "audio/mpeg" = audioplayer;
    "audio/ogg" = audioplayer;

    "application/pdf" = pdfviewer;
  };
}

