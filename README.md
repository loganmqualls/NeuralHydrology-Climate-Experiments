# NeuralHydrology-Climate-Experiments

Although deep learning hydrological models provide the most accurate streamflow predictions to-date, concerns about their reliablility in real-world conditions have been raised. Long Short-Term Memory (LSTM) models have demonstrated a unique ability to extrapolate in such scenarios, addressing problems like predictions in ungaged basins and extreme event detection (Hrachowitz et al., 2013; Frame et al., 2021). Hydrological responses are prone to change, particularly under changing climate conditions. To investigate LSTM robustness under climate change, biased train and test were created to simulate changing climate distributions. By training the model on data from hydrological years characterized by one climate extreme and quantifying their predictive ability on test years characterized by the opposite extreme, we can simulate climate nonstationarity and begin to assess model robustness.

This repository is designed to create climate experiments for both NeuralHydrology LSTM and Sacramento Soil Moisture Accounting (SAC-SMA) models using the National Center for Atmospheric Research's (NCAR) Catchment Attributes and Meteorology for Large-Sample Studies (CAMELS) dataset. 

The CAMELS dataset consists of more than 3 decades of hydrological data for 671 minimally-impacted United States Geological Survey catchements (basins) within the contiguous United States (Newman et al., 2015). Several forcing sources are avaliable, including Daymet, Maurer, and NLDAS. In addition to daily meteorological data, static, or unchanging, catchment attributes are provided as quantified descriptors of a basin's characteristics (Addor et al., 2017). These static attribtues include information about each watershed's geology, geography, vegetation, climate, and more. The CAMELS dataset is publically avaliable via NCAR (https://ral.ucar.edu/solutions/products/camels). This repository is designed to work with CAMELS version 2 to have the CAMELS directory in the main directory with the Jupyter Notebooks. 

NeuralHydrology (NH) is a Python library specifically designed for deep learning hydrological modeling and offers a variety of LSTM model designs (Kratzert et al., 202X). NH provides a flexible framework for data integration and model customization and includes several detailed walk-through examples to help get you started. More information can be found at their documentation webpage (https://neuralhydrology.readthedocs.io/en/latest/index.html) and the GitHub repository (https://github.com/neuralhydrology/neuralhydrology/blob/master/docs/source/index.rst). This repository is designed to work with NH in the "nh" directory.

The SAC-SMA model used in these experiments are from Upstream-Tech and includes the Snow-17 model. This code provides a Python interface and is specifically designed to use NH's configuration files. More information and code can be found at their GitHub repository (https://github.com/Upstream-Tech/SACSMA-SNOW17). This repository is designed to work with the SAC-SMA model in the "sacsma" directory.

In the NeuralHydrology-Climate-Experiments folder there are several directories and Jupyter Notebooks. The Jupyter Notebooks are numbered to detail the workflow and streamflow model configuration, run send-off, visual analyses, and metric plotting. The config_complementaries folder contains a variety of files to be used as inputs into the models, including dummy configuration files, basin lists that define which basins data will be sourced from, and, most importantly, dynamic climate indices files and train/test set files. The "nwm" directory also contains data from the National Water Model that will be used as a benchmark model for the LSTM and SAC-SMA models. The "nh" directory contains an environment.yml file for NH as well as a "configs" dir to store configuration files made by notebook 2. Similarly, SAC-SMA contains the SACSMA-Snow-17 environment.yml file, its own "config" directory, and several directories necessary for successful model creation and calibration. Finally, the "functions" directory contains several Python script files of NH functions, with altered paths for use in this repository, necessary for model ensembling and analysis.

The notebooks, as mentioned before, represent the average workflow. The first notebook utilizes NH's calculate dynamic climate indices function to create dynamic climate indices files that are used as "additional features" in models using daily dynamic climate indices inputs. Notebook 2 creates biased or random train and test set files as well as model configuration files for NH and SAC-SMA. Notebook 3 creates slurm job scripts and sends the SAC-SMA model runs off. The fourth notebook ensembles a model's ensemble members and calculates metrics on the specified test set years. Notebook 5 performs comparative analyses between two models. Finally, notebook 6 visualizes all model performances as cumulative density function plots.
