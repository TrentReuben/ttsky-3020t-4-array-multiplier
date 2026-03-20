
# Installation of Pre-requisite Programs and Toolchain Setup

The installation of these programs are geared towards hardening your local project which is the final step of your ASIC implementation or further testing. This setup is based on the Windows OS.

Source: 
1. [Testing your design](https://tinytapeout.com/hdl/testing/)
2. [Hardening Tiny Tapeout Projects Locally](https://www.tinytapeout.com/guides/local-hardening/)

The local hardening of the project requires the following:
1. Windows Subsystem for Linux (WSL)
2. Git
3. Docker

## WSL

For WSL or commonly referred to as Ubuntu, can be installed through the Microsoft Store:

![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320110300.png)

Using this installation method is simple when considering environment paths and additional installation steps. WSL can also be installed using command line in PowerShell but it is not covered here. 

## Git

If there is a lack of a "Git" installation, the following is a procedure to access Git. This is required to clone the Github repository locally. 

Standalone installation (select required setup): https://git-scm.com/install/windows 

When downloaded, follow the installation setup accordingly. 

Select Next: \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320105209.png)

Select Next: \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320105250.png)

Select an appropriate editor, and select Next: \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320105328.png)

Select Next (or Override the branch name and select Next (Optional)): \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320105614.png)

Leave as is for recommended for PATH, select Next: \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320105715.png)

Select Next: \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320105802.png)

Select Next: \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320105832.png)

Select Next: \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320105856.png)

Select default Console Window (cmd), select Next: \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320105930.png)

Select Next: \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320110009.png)

Select Next: \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320110031.png)

Select Install: \
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320110059.png)

## Docker

Docker for Windows: https://www.docker.com/

Select required installation: 
![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/Pasted%20image%2020260320111341.png)

Additional Help (Ref: BTNHD on Youtube): [Docker Desktop on Windows: Install & First Launch](https://www.youtube.com/watch?v=B6kYsucb128)

1. When the Installation executable is downloaded, launch the file as "Run as administrator".
2. When the Configuration Window opens, ensure "Use WSL" is select and select any other requirements as needed. Select "OK".
3. Docker will unpack and install Docker Desktop.
4. When completed, the app will prompt a restart.

![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/docker.png)

5. When restarted, docker will launch automatically.

![](https://github.com/TrentReuben/ttsky-3020t-4-array-multiplier/blob/main/Project_Images/Test%20_Folder/docker2.png)

6. Accept the terms and conditions.
7. Login/Sign up into Docker 
8. The system will prompt to run "Docker Desktop". 
9. When the application is opened, it will prompt a WSL update if required.
10. If needed, open cmd or powershell copy the command "wsl --update" as seen in Docker.
11. Once complete, prompt the restart for the application and once loaded, the application can be exited. 

## Setting up Ubuntu with necessary libraries (In Ubuntu)

1. Updating WSL
```sh
	sudo apt update
```

2. Installing make to run Makefile
```sh
   sudo apt install make
```

3. Installing Python
```sh
	sudo apt install python3 python3-pip
```

4. Checking python and pip version
```sh
	python3 --version
	python3 -m pip --version
```

5. Installing Python Virtual environment (Based on python version installed)
```sh
	sudo apt install python3.12-venv
```

 The following is based on the original "Sample testbench for a Tiny Tapeout project"

This is a sample testbench for a Tiny Tapeout project. It uses (**Recommended to look at**) [cocotb](https://docs.cocotb.org/en/stable/) to drive the DUT and check the outputs.

See below to get started or for more information, check the [website](https://tinytapeout.com/hdl/testing/).

### Setting up the verilog project   
Note: It is recommended to follow the "Hardening a Tiny Tapout Project Locally" below for a full functional test of the system. 

Additional Sources:
Tinytapeout Testing: https://tinytapeout.com/hdl/testing/  \
Cocotb Documentation: https://docs.cocotb.org/en/stable/install.html

1. Edit [Makefile](Makefile) and modify `PROJECT_SOURCES` to point to your Verilog files.

2. Edit [tb.v](tb.v) and replace `tt_um_example` with your module name.

### How to run

To run the RTL simulation:

```sh
make -B
```

To run gatelevel simulation, first harden your project and copy `../runs/wokwi/results/final/verilog/gl/{your_module_name}.v` to `gate_level_netlist.v`.

Then run:
```sh
make -B GATES=yes
```

If you wish to save the waveform in VCD format instead of FST format, edit tb.v to use `$dumpfile("tb.vcd");` and then run:

```sh
make -B FST=
```

This will generate `tb.vcd` instead of `tb.fst`.

### How to view the waveform file

Using GTKWave

```sh
gtkwave tb.fst tb.gtkw
```

Using Surfer

```sh
surfer tb.fst
```

## Step by Step Local Testing Example
For additional information regarding testing, the following is a set through of running a local testing without Hardening the project.

1. Install iverlog
```sh
	sudo apt install iverilog verilator
```

Check version
```sh
	iverilog -v
```

2. Install gtkwave
```sh
	sudo apt install gtkwave
```

Check version
```sh
	gtkwave
```

3. Create virtual environment to work in:
```sh 
	python3 -m venv my_project_env 
```
where "my_project_env" is the virtual environment name

2. Activate venv
```sh
	source my_project_env/bin/activate
```

3. Install cocotb in venv
```sh
	pip install "cocotb~=2.0"
	pip install cocotb pytest
```

Check version
```sh
	cocotb-config --version
```

4. Clone project into venv
```sh
	git clone "insert url here"
```

5. Enter the test folder using within the project
```
Check current direcory file: ls
Go back a directory: cd..
Enter a foler : cd "folder name"
```

6. Run make
```sh
	make
```

7. Run gtkwave
```sh
	gtkwave tb.gtkw
```

8. To dactivate the venv
```sh
	deactivate
```

## Hardening a Tiny Tapout Project Locally

Source: https://www.tinytapeout.com/guides/local-hardening/

- The source above defines how to test and locally harden the project once the prerequisites are installed and Ubuntu/WSL is setup accordingly. This information is also constantly updated hence not provided here based on any changes. 
