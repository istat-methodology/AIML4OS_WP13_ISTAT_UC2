<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>AIML4OS WP13 – ISTAT Use Case 2</title>
  <style>
    body {
      font-family: Arial, Helvetica, sans-serif;
      line-height: 1.6;
      color: #222;
      max-width: 1050px;
      margin: 0 auto;
      padding: 40px 28px;
      background: #ffffff;
    }
    h1 {
      color: #17324d;
      border-bottom: 3px solid #17324d;
      padding-bottom: 10px;
      margin-bottom: 10px;
    }
    h2 {
      color: #17324d;
      margin-top: 36px;
      border-bottom: 1px solid #d9e2ec;
      padding-bottom: 6px;
    }
    h3 {
      color: #29465f;
      margin-top: 26px;
    }
    p {
      margin: 12px 0;
    }
    ul, ol {
      margin: 10px 0 10px 28px;
      padding: 0;
    }
    code {
      background: #f3f5f7;
      padding: 2px 5px;
      border-radius: 4px;
      font-family: Consolas, "Courier New", monospace;
      font-size: 0.95em;
    }
    pre {
      background: #f3f5f7;
      padding: 16px;
      border-radius: 8px;
      overflow-x: auto;
      border: 1px solid #d9e2ec;
    }
    pre code {
      background: transparent;
      padding: 0;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 18px 0;
      font-size: 0.95em;
    }
    th, td {
      border: 1px solid #d9e2ec;
      padding: 10px 12px;
      vertical-align: top;
    }
    th {
      background: #eef3f8;
      color: #17324d;
      text-align: left;
    }
    tr:nth-child(even) td {
      background: #fafafa;
    }
    blockquote {
      border-left: 4px solid #17324d;
      margin: 18px 0;
      padding: 10px 18px;
      background: #f7f9fb;
      color: #333;
    }
    hr {
      border: none;
      border-top: 1px solid #d9e2ec;
      margin: 30px 0;
    }
    .subtitle {
      color: #52616f;
      font-size: 1.05em;
      margin-bottom: 28px;
    }
  </style>
</head>
<body>
<h1>AIML4OS WP13 – ISTAT Use Case 2</h1>
<h2>Synthetic Data Generation and Utility–Privacy Trade-off Assessment</h2>
<p>This repository contains the Python code developed by Istat within <strong>Work Package 13 (WP13) of the AIML4OS project</strong> for the Italian <strong>Use Case 2</strong>.</p>
<p>The use case focuses on the development of a controlled experimental framework to assess the trade-off between:</p>
<ul><li><strong>utility</strong>, i.e. the ability of synthetic data to preserve relevant statistical and analytical information from the original data;</li>
<li><strong>privacy protection</strong>, i.e. the extent to which synthetic data reduce the risk of disclosing information about the original records.</li></ul>
<p>The repository is intended to support reproducibility, transparency and reuse of the methodology developed within AIML4OS.</p>
<hr>
<h2>1. Context and objective</h2>
<p>Synthetic data are increasingly considered as a possible solution for enabling data sharing, methodological experimentation and collaborative research while reducing privacy risks.</p>
<p>However, generating synthetic data is not sufficient by itself. It is also necessary to evaluate whether the generated data:</p>
<ol><li>preserve enough information to be useful for statistical or machine learning tasks;</li>
<li>avoid reproducing individual-level information too closely;</li>
<li>provide a measurable balance between analytical utility and privacy protection.</li></ol>
<p>For this reason, the ISTAT Use Case 2 adopts a <strong>controlled experimental setting</strong>. A synthetic “real” dataset is generated first, with known structure and controlled relationships between variables. This dataset is then used as the reference data source for generating synthetic datasets and evaluating both utility and privacy risk.</p>
<p>The general workflow is:</p>
<ol><li>build a controlled reference dataset;</li>
<li>generate synthetic data using different methods;</li>
<li>evaluate utility through classification tasks;</li>
<li>evaluate privacy risk through attack scenarios;</li>
<li>compare results across methods and experimental settings.</li></ol>
<hr>
<h2>2. Repository structure</h2>
<p>The repository is organized as a sequence of Jupyter notebooks, each corresponding to a specific step of the workflow.</p>
<pre><code>AIML4OS_WP13_ISTAT_UC2/
│
├── notebooks/
│   ├── Step_1_Generate real dataset.ipynb
│   ├── Step_2a_Synthetic_data_generation_SDV.ipynb
│   ├── Step_2b_Synthetic_data_generation_Inc-XGB.ipynb
│   ├── Step_3_Classification_Task.ipynb
│   ├── Step_4a_First_Privacy_Attack_with_distance_metrics.ipynb
│   └── Step_4b_Second_Privacy_Attack_with_ML.ipynb
│
├── sspcloud/
│   ├── download_data.sh
│   ├── download_notebook.sh
│   ├── init-trainees.sh
│   └── restore_environment.sh
│
├── chapters/
├── images/
├── resources/
├── pyproject.toml
└── README.md</code></pre>
<p>The folder <code>notebooks/</code> contains the core analytical workflow.</p>
<p>The folder <code>sspcloud/</code> contains shell scripts useful for setting up the working environment and downloading data/notebooks in the SSPCloud/Onyxia environment.</p>
<p>The other folders are related to the AIML4OS Quarto training material template and documentation structure.</p>
<hr>
<h2>3. Workflow description</h2>
<h3>Step 1 – Generation of the reference dataset</h3>
<p>Notebook:</p>
<pre><code>notebooks/Step_1_Generate real dataset.ipynb</code></pre>
<p>This notebook builds the reference dataset used in the experiment.</p>
<p>The dataset is artificially generated but designed to resemble a realistic statistical dataset. Some demographic distributions, such as age, gender and civil status, are derived from publicly available Istat demographic information.</p>
<p>The generated dataset includes variables such as:</p>
<ul><li>demographic variables;</li>
<li>municipality-related variables;</li>
<li>physical activity;</li>
<li>genetic predisposition;</li>
<li>a target variable representing a four-class diagnosis;</li>
<li>derived score variables used to control the relationship between explanatory variables and the target.</li></ul>
<p>Although the dataset is artificial, it is treated in the experiment as the “real” dataset. This allows the privacy and utility assessment to be performed in a controlled and reproducible way.</p>
<hr>
<h3>Step 2a – Synthetic data generation using SDV</h3>
<p>Notebook:</p>
<pre><code>notebooks/Step_2a_Synthetic_data_generation_SDV.ipynb</code></pre>
<p>This notebook applies synthetic data generation methods based on the <strong>Synthetic Data Vault (SDV)</strong> ecosystem.</p>
<p>The aim is to generate synthetic versions of the reference dataset using model-based approaches and then compare their analytical behaviour with the original data.</p>
<p>Depending on the specific configuration, this step may include generative models such as CTGAN, TVAE or other SDV-compatible synthesizers.</p>
<hr>
<h3>Step 2b – Synthetic data generation using Inc-XGB</h3>
<p>Notebook:</p>
<pre><code>notebooks/Step_2b_Synthetic_data_generation_Inc-XGB.ipynb</code></pre>
<p>This notebook implements the synthetic data generation process based on an incremental XGBoost-related approach.</p>
<p>The rationale is to generate synthetic records by modelling the variables sequentially or conditionally, preserving relevant multivariate relationships among variables.</p>
<p>This step provides an alternative to the SDV-based generators, allowing comparison across different synthetic data generation strategies.</p>
<hr>
<h3>Step 3 – Utility assessment through classification</h3>
<p>Notebook:</p>
<pre><code>notebooks/Step_3_Classification_Task.ipynb</code></pre>
<p>This notebook evaluates the utility of the generated synthetic datasets.</p>
<p>The main idea is to test whether synthetic data preserve enough information to support a predictive task comparable to the one performed on the reference dataset.</p>
<p>Typical classification models considered in this framework include:</p>
<ul><li>Logistic Regression;</li>
<li>Random Forest;</li>
<li>Multi-Layer Perceptron;</li>
<li>XGB.</li></ul>
<p>The classification task focuses on the target variable generated in Step 1. Utility is assessed by comparing model performance across real and synthetic data under different train/test configurations.</p>
<hr>
<h3>Step 4a – Privacy attack based on distance metrics</h3>
<p>Notebook:</p>
<pre><code>notebooks/Step_4a_First_Privacy_Attack_with_distance_metrics.ipynb</code></pre>
<p>This notebook implements a first privacy-risk assessment based on distance metrics.</p>
<p>The underlying idea is to evaluate whether synthetic records are too close to original records. If a synthetic dataset contains records that are very similar to individual records in the reference dataset, this may indicate a higher risk of memorization or disclosure.</p>
<p>This step may include:</p>
<ul><li>nearest-neighbour searches;</li>
<li>comparison between real and synthetic records;</li>
<li>top-k similarity analysis;</li>
<li>distance-based metrics suitable for mixed-type data.</li></ul>
<p>The objective is not only to measure closeness, but also to understand whether the synthetic generator is learning general population patterns or reproducing individual-level information too precisely.</p>
<hr>
<h3>Step 4b – Privacy attack based on machine learning</h3>
<p>Notebook:</p>
<pre><code>notebooks/Step_4b_Second_Privacy_Attack_with_ML.ipynb</code></pre>
<p>This notebook implements the second privacy attack, based on a machine-learning approach.</p>
<p>The attack does not directly compare original and synthetic records through distance metrics. Instead, it builds a set of meta-features that describe how a classification model behaves when it is trained and tested on different combinations of real and synthetic data.</p>
<p>These meta-features summarize the predictive behaviour of the models and are then used to train an attack classifier. The goal is to assess whether the synthetic data preserve only general statistical patterns or whether they contain signals that make them too informative about the original data.</p>
<hr>
<h2>4. Expected outputs</h2>
<p>The workflow produces intermediate and final outputs that may include:</p>
<ul><li>generated reference datasets;</li>
<li>synthetic datasets obtained with different generators;</li>
<li>classification performance indicators;</li>
<li>privacy attack results;</li>
<li>tables and figures for comparing utility and privacy risk;</li>
<li>evidence supporting the evaluation of the utility–privacy trade-off.</li></ul>
<p>The exact output files depend on the execution environment and on the configuration used in each notebook.</p>
<hr>
<h2>5. How to run the notebooks</h2>
<p>A recommended execution order is:</p>
<pre><code>1. Step_1_Generate real dataset.ipynb
2. Step_2a_Synthetic_data_generation_SDV.ipynb
3. Step_2b_Synthetic_data_generation_Inc-XGB.ipynb
4. Step_3_Classification_Task.ipynb
5. Step_4a_First_Privacy_Attack_with_distance_metrics.ipynb
6. Step_4b_Second_Privacy_Attack_with_ML.ipynb</code></pre>
<p>The notebooks are designed to be executed sequentially, since the outputs of one step are used as inputs for the following steps.</p>
<p>Before running the workflow, users should check:</p>
<ul><li>the expected input and output folders;</li>
<li>the Python environment;</li>
<li>the availability of required packages;</li>
<li>the execution path used by the notebooks;</li>
<li>whether the data download scripts in <code>sspcloud/</code> are needed for the selected environment.</li></ul>
<hr>
<h2>6. Methodological notes</h2>
<p>This use case is based on a controlled experimental framework. This means that the “real” dataset is not an actual confidential microdata file, but an artificially generated dataset whose structure is known by design.</p>
<p>This choice has several advantages:</p>
<ul><li>it allows the experiment to be fully reproducible;</li>
<li>it avoids the use of confidential data;</li>
<li>it makes it possible to control the relationship between input variables and the target variable;</li>
<li>it supports a clearer interpretation of utility and privacy results;</li>
<li>it provides a safe environment for testing privacy attacks.</li></ul>
<p>The framework can be adapted to other datasets, provided that the data structure, the target variable and the privacy attack scenarios are properly redefined.</p>
<hr>
<h2>7. Attribution of code development</h2>
<p>The following table can be used to document the contribution of each colleague to the different parts of the workflow.</p>
<table>
<thead><tr><th>Step</th><th>Notebook / component</th><th>Main activity</th><th>Contributor(s)</th></tr></thead>
<tbody>
<tr><td>Step 1</td><td><code>Step_1_Generate real dataset.ipynb</code></td><td>Generation of the controlled reference dataset and definition of the target variable</td><td>Fabio Spagnuolo (Istat)</td></tr>
<tr><td>Step 2a</td><td><code>Step_2a_Synthetic_data_generation_SDV.ipynb</code></td><td>Synthetic data generation using SDV-based methods</td><td>Massimo De Cubellis (Istat)</td></tr>
<tr><td>Step 2b</td><td><code>Step_2b_Synthetic_data_generation_Inc-XGB.ipynb</code></td><td>Synthetic data generation using Inc-XGB approach</td><td>Fabio Spagnuolo (Istat)</td></tr>
<tr><td>Step 3</td><td><code>Step_3_Classification_Task.ipynb</code></td><td>Utility assessment through classification models</td><td>Donatella Papa (Istat)</tr>
<tr><td>Step 4a</td><td><code>Step_4a_First_Privacy_Attack_with_distance_metrics.ipynb</code></td><td>Privacy-risk assessment using distance-based attacks</td><td>Donatella Papa (Istat) and Fabio Spagnuolo (Istat)</td></tr>
<tr><td>Step 4b</td><td><code>Step_4b_Second_Privacy_Attack_with_ML.ipynb</code></td><td>Privacy-risk assessment using machine-learning-based attacks</td><td>Donatella Papa (Istat)</td></tr>
</tbody></table>
<hr>
<h2>8. Suggested citation / acknowledgement</h2>
<p>When reusing or referring to this material, please acknowledge:</p>
<blockquote>Istat contribution to AIML4OS Work Package 13 – Synthetic Data, Use Case 2: Synthetic Data Generation and Utility–Privacy Trade-off Assessment Framework.</blockquote>
<p>A more formal citation can be added when a project deliverable, working paper, conference contribution or journal article associated with this repository becomes available.</p>
<hr>
<h2>9. Disclaimer</h2>
<p>This repository is intended for research, methodological experimentation and training purposes within the AIML4OS project.</p>
<p>The dataset generated in the workflow is artificial and should not be interpreted as an official Istat statistical release. The results produced by the notebooks depend on the experimental configuration and should be interpreted in the context of the methodological framework described above.</p>
<hr>
</body>
</html>
