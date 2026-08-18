import sys
from pathlib import Path

script_dir = Path(__file__).resolve().parent
project_root = script_dir.parent.parent

target_ext = [
    ".chp",
]

target_folder = [
    project_root / "plugin" / "1_line",
    project_root / "plugin" / "2_line",
    project_root / "plugin" / "3_line",
    project_root / "plugin" / "4_line",
    project_root / "plugin" / "5_line",
    project_root / "plugin" / "6_line",
]

def rename_files_in_folder(
    folder_path: Path,
    extensions: list[str],
):
    if not folder_path.exists():
        print(f"\x1b[1;31m[!] \x1b[0mFolder: \x1b[0;32m{folder_path} \x1b[0mnot found!")
        sys.exit(1)
    if not folder_path.is_dir():
        print(f"\x1b[1;31m[!] \x1b[0mFile: \x1b[0;32m{folder_path} \x1b[0mis not a folder!")
        sys.exit(1)

    files = []
    for ext in extensions:
        files.extend(
            [f for f in folder_path.glob(
                f"*{ext}",
            ) if f.is_file()],
        )
    
    files.sort(key=lambda x: x.name)
    if not files:
        print(f"\x1b[1;33m[!] \x1b[0mNo matching files found in: \x1b[0;32m{folder_path}\x1b[0m")
        return

    already_sorted = True
    for idx, file_path in enumerate(files, start=1):
        expected_name = f"{idx}{file_path.suffix}"
        if file_path.name != expected_name:
            already_sorted = False
            break

    if already_sorted:
        print(f"\x1b[0;33m[!] \x1b[0mFolder: \x1b[0;32m{folder_path.name} \x1b[0mis already sorted.")
        return

    temp_files = []
    for idx, file_path in enumerate(files, start=1):
        temp_name = folder_path / f"__temp_rename_{idx}_{file_path.name}"
        try:
            file_path.rename(temp_name)
            temp_files.append(
                (temp_name, file_path.suffix),
            )
        except Exception as e:
            print(f"\x1b[1;31m[!] \x1b[0mFailed to process: \x1b[0;32m{file_path.name} \x1b[1;90m(\x1b[0;32m{e}\x1b[1;90m)\x1b[0m")
            return

    current_counter = 1
    for temp_path, ext in temp_files:
        while True:
            target_file = folder_path / f"{current_counter}{ext}"
            if not target_file.exists():
                break
            current_counter += 1

        try:
            temp_path.rename(target_file)
            print(f"\x1b[0;32m[+] \x1b[0mRenamed to: \x1b[0;32m{target_file.name}\x1b[0m")
            current_counter += 1
        except Exception as e:
            print(f"\x1b[1;31m[!] \x1b[0mFailed renaming: \x1b[0;32m{temp_path.name} \x1b[0mto \x1b[0;32m{target_file.name} \x1b[1;90m(\x1b[0;32m{e}\x1b[1;90m)\x1b[0m")

for folder in target_folder:
    rename_files_in_folder(
        folder,
        target_ext,
    )