import subprocess

subprocess.run(["docker", "compose", "build"])
subprocess.run(["docker", "compose", "up", "-d", "--force-recreate"])
