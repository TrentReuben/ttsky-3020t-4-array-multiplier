
![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)


# Tutorial Walkthrough and Associated Manuals for Using TinyTapeout for an Open Source ASIC Workflow


This ReadME explores the specifics of setting up a Github Repository and Toolchain required to successfully follow through an ASIC implementation using Verilog. This provides added detail to the already provided "Tiny Tapeout Verilog Project Template" for new users acting as a centralised location for all the necessary information from start to finish. It also lists all included or additional sources required.  


Source: 
Site: https://tinytapeout.com/chips/tt09/tt_um_a_0_array_multiplier
Repository: https://github.com/northbear99/tt09-secA-7-array-multiplier

- [Read the documentation for project](docs/info.md)

## What is Tiny Tapeout?

Tiny Tapeout is an educational project that aims to make it easier and cheaper than ever to get your digital and analog designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

# Setting Up your GitHub Repository

Sources and Additional Help:
Tiny Tapeout - Getting your design ready to submit:  https://www.youtube.com/watch?v=fCGPKdmM3Dc
Tiny Tapeout 4 - working with an HDL: https://www.youtube.com/watch?v=KbWb6xd9jFE

From the [verilog template](https://github.com/TinyTapeout/ttsky-verilog-template), copy the github repository by clicking the "Use this template" and then the "Create a new repository". 

![[Pasted image 20260319192827.png]]

On the "Create a new repository" Page:
1. Name the repository
2. Add a description (Optional)
3. Ensure the visibility is public
4. Click "Create repository" 

![[Pasted image 20260319193108.png]]

Once created, enable Github Actions in "Settings".

Source: https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part

1. This is enabled by navigating to the "Pages" located in the most left column under "Code and Automation". 
2. Under "Build and deployment", for the "Source", enable github actions by clicking the drop down and selectiong "Github Actions."
	- This allows for building within Github and further context is provided in  [Tiny Tapeout - a look at the GitHub action that creates the GDS files](https://www.youtube.com/watch?v=lXKt7CKRUes)

![[Pasted image 20260319194231.png]]

Once this is completed, you are able to set up your Verilog Project.

# Set up your Verilog project

Before starting the setup, it is recommended to explore "[Working with HDLs](https://tinytapeout.com/hdl/)", paying strict attention (Mandatory) to the "[Important](https://tinytapeout.com/hdl/important/)" page as this explain naming conventions and addition information for the source files.

1. Add your Verilog files to the `src` folder. It is recommended not to configure the "config.json" file as this can disrupt the build of the project.
2. Edit the [info.yaml](info.yaml) and update information about your project, paying special attention to the `source_files` and `top_module` properties. If you are upgrading an existing Tiny Tapeout project, check out our [online info.yaml migration tool](https://tinytapeout.github.io/tt-yaml-upgrade-tool/).
	- You are expected to configure the following:
		1. title
		2. author
		3. description
		4. language 
		5. top_module
		6. source_files
		7. Input and Output pins
3. Edit [docs/info.md](docs/info.md) and add a description of your project.
4. Adapt the testbench to your design. See [test/README.md](test/README.md) for more information.

Note: Proper configuration of the `info.yaml` and `info.md` is required for the github action "docs" to pass. 

The GitHub action will automatically build the ASIC files using [LibreLane](https://www.zerotoasiccourse.com/terminology/librelane/).

For the Verilog Project to be consider successful, "gds", "docs" and "test" must all display a a green "passing". 

# Github Actions are Failing
Additional information is provided [here](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part). 

This information cover how to access the workflows and identify errors. It must be noted that all updated files must have a "green check mark" before running any workflows and not exist in the pending state.  Github also automatically runs all the workflows based on any updated made to the repository.

To access the Github Actions, navigate to the "Actions". All the workflows are present on the left column. 

![[Pasted image 20260319203411.png]]

To manually run a workflow, click the required workflow and navigate to the "Run workflow" drop down and select run workflow.

![[Pasted image 20260319203525.png]]

When the workflow is executed, the action will run and any information regarding can be accessed by clicking on the run. 

![[Pasted image 20260319204016.png]]

![[Pasted image 20260319203917.png]]

Further information can be accessed by clicking on the steps executed.

![[Pasted image 20260319204137.png]]

## Resources

- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://tinytapeout.com/discord)
- [Build your design locally](https://www.tinytapeout.com/guides/local-hardening/)
- [Local Verilog Simulation for TInyTapeout: IEEE Columbus SSCS/CAS ](https://www.youtube.com/watch?v=f95Qanovx_c)

## What next?

- [Submit your design to the next shuttle](https://app.tinytapeout.com/).
- Edit [this README](Tutorial%20Walkthrough%20and%20Associated%20Manuals%20for%20Using%20TinyTapeout%20for%20an%20Open%20Source%20ASIC%20Workflow.md) and explain your design, how it works, and how to test it.
- Share your project on your social network of choice:
  - LinkedIn [#tinytapeout](https://www.linkedin.com/search/results/content/?keywords=%23tinytapeout) [@TinyTapeout](https://www.linkedin.com/company/100708654/)
  - Mastodon [#tinytapeout](https://chaos.social/tags/tinytapeout) [@matthewvenn](https://chaos.social/@matthewvenn)
  - X (formerly Twitter) [#tinytapeout](https://twitter.com/hashtag/tinytapeout) [@tinytapeout](https://twitter.com/tinytapeout)
  - Bluesky [@tinytapeout.com](https://bsky.app/profile/tinytapeout.com)
