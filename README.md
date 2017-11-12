# PowerShell-FileSearch
This was written as a simple powershell function to search a directory and sub-directories for specific fyle types (eg: .exe) that are writable by the searching user. It wil attempt to open each file in a writable mode, if it seccedes it'll add it to the list, failes and it'll move on. This should scan on any mapable drive as well.
