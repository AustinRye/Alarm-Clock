import os


apt_dependencies = ["vim", "python3-pip"]
pip_dependencies = ["flask"]

if __name__ == "__main__":

    print("##############################")
    print("## Installing Apt Dependencies")
    print("##############################")
    for dependency in apt_dependencies:
        print("//////////////////////////////")
        print("// Apt: %s" % dependency)
        print("//////////////////////////////")
        os.system("sudo apt install %s" % dependency)

    print("##############################")
    print("## Installing Pip Dependencies")
    print("##############################")
    for dependency in pip_dependencies:
        print("//////////////////////////////")
        print("// Pip: %s" % dependency)
        print("//////////////////////////////")
        os.system("sudo pip3 install %s" % dependency)
