enum FileType { FOLDER, IMAGE, VIDEO, MUSIC, PDF, HTML, TABLE, ACCORDION, REPORT }

class DesktopIcon {
  late FileType fileType;
  late String icon;
  late String name;

  DesktopIcon(this.fileType, this.icon, this.name);
}

List<DesktopIcon> iconsDesk = [
  DesktopIcon(FileType.PDF, '/icons/pdf-file.png', 'PDF'),
  DesktopIcon(FileType.ACCORDION, '/icons/dropdown-arrow.png', 'Lista desplegable'),
  DesktopIcon(FileType.REPORT, '/icons/report.png', 'Reporte'),
  DesktopIcon(FileType.TABLE, '/icons/table.png', 'Tabla'),
  DesktopIcon(FileType.IMAGE, '/icons/image.png', 'Imagen'),
];