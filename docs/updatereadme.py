import glob
import subprocess


def filebrowser(ext=""):
    "Returns files with an extension"
    return [file for file in glob.glob(f"../x86_64/*{ext}")]

files = filebrowser(".pkg.tar.zst")

files.sort()

def get_file_name(file):
    awk1 = "awk '{print $0}'"
    awk2 = "awk '{$1=$2=\"\"; print $0}'"
    command = f"bsdtar -xOf {file} | {awk1} | grep -I pkgname | {awk2}"
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=None, shell=True)
    output = process.communicate()
    name = str(output[0].decode()).strip()

    return name

def get_file_version(file, name):
    command = f"pacman -Si cynicalteam/{name}"
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=None, shell=True)
    output = process.communicate()
    link = f'<a href="../{file}">{name}</a>'
    version = str(output[0].decode())\
    .replace("Repository","<b>Repository</b>").strip()\
    .replace("Name","<b>Name</b>").strip()\
    .replace(f"           : {name}",f"           : {link}").strip()\
    .replace("Version","<b>Version</b>").strip()\
    .replace("Description","<b>Description</b>").strip()\
    .replace("Architecture","<b>Architecture</b>").strip()\
    .replace("URL","<b>URL</b>").strip()\
    .replace("Licenses","<b>Licenses</b>").strip()\
    .replace("Groups","<b>Groups</b>").strip()\
    .replace("Provides","<b>Provides</b>").strip()\
    .replace("Depends On","<b>Depends On</b>").strip()\
    .replace("Optional Deps","<b>Optional Deps</b>").strip()\
    .replace("Conflicts With","<b>Conflicts With</b>").strip()\
    .replace("Replaces","<b>Replaces</b>").strip()\
    .replace("Download Size","<b>Download Size</b>").strip()\
    .replace("Installed Size","<b>Installed Size</b>").strip()\
    .replace("Packager","<b>Packager</b>").strip()\
    .replace("Build Date","<b>Build Date</b>").strip()\
    .replace("Validated By","<b>Validated By</b>").strip()

    return version

for file in files:
    ignore = open("../ignorepackages", "r").read().splitlines() 
    name = str(get_file_name(file))
    if name not in ignore:
        name = str(get_file_name(file))
        version = str(get_file_version(file, name))
        if not name:
            name = str(get_file_name(file))
        if not version:
            version = str(get_file_version(file, name))
    
        command = f'mkdir -p "{name}"'
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=None, shell=True)
        command2 = f"touch {name}/README.md"
        process2 = subprocess.Popen(command2, stdout=subprocess.PIPE, stderr=None, shell=True)

        print(f"File Updated: ({name})")
        readme = open(f'{name}/README.md','w')
        readme.write(f"# Check cynicalteam for download\n")
        readme.write(f"\npacman -Si *cynicalteam/{name}*\n")
        highlight = '<div class="highlight"><pre class="highlight"><text>'
        readme.write(f"\n{highlight}\n")
        readme.write(f"{version}")
        text = '</text></pre></div>'
        readme.write(f"\n{text}\n")
        readme.write(f"\n## How to install from cynicalteam\n")
        readme.write(f"\npacman -S *cynicalteam/{name}*\n")
        readme.close()
