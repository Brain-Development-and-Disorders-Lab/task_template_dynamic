# Template (General)

The template repository for code and data associated with publications from the Brain Development and Disorders Lab.

## Template features

- **Issue Templates**: A bug report issue template has been included.
- **Citation File**: A citation file has been included. This should be updated with appropriate details to ensure any code in the repository can be cited easily and correctly.

The default branch is named `main`.

## Using the template

To use the template, click the green _Use this template_ button. This will prompt you to configure your new repository.

1. Set the owner to `Brain-Development-and-Disorders-Lab` from the drop-down menu. If you cannot set the organisation, make sure you are a member.

2. Set the name of the repository. The naming standard is: `Author_etal_YYYY[_keywords]` where `keywords` is an optional set of keywords associated with the publication. Examples of repository names that use this standard:
    - `Smith_etal_2021`: code and data associated with John Smith's publication in 2021.
    - `Smith_etal_2021_cat_cognition`: code and data associate with John Smith's ground-breaking publication in 2021 that examines cognition in cats.

3. Provide a description of the repository. This should be about one sentence that concisely outlines what publication the code and data is associated with and what is contained in the repository.

4. Set the repository visibility initially to `Private`.

5. Click `Create repository from template`, then proceed to add your files.

### Recommended configuration

- **Branch protection**: Branch protection should be enabled for the `main` branch. Only the code owners should be able to push to the `main` branch. The following rules are recommended to be enforced:
  - _Require a pull request before merging_
  - _Require status checks to pass before merging_ (if status checks have been enabled)
  - _Include administrators_
- **GitHub Actions**: GitHub Actions should be disabled by default. They can be enabled if required.
- **GitHub Wikis**: GitHub Wikis should be disabled by default. Data and code documentation are included and versioned in the repository.
- **GitHub Projects**: Unless the repository is a work-in-progress, GitHub Projects should be disabled.

## Preparing for release

Before releasing code and data using this template, a number of steps should be taken to ensure the repository is adequately prepared.

1. Apply recommended security features such as branch protection after creating the repository from the template.

2. Create or update the `.gitignore` file. A `.gitignore` file allows files matching certain patterns to be excluded from version control. This is useful for projects that automatically create extra artefacts such as caches or temporary files. A `.gitignore` file has been included in this repository as a generic starting point.

3. Create or update the repository license. There are many licenses available for open-source projects. An appropriate license should be added to the repository.

4. Ensure all dependencies are correctly listed and up to date. This is of paramount importance if external packages are used or referenced throughout the code.

5. Update the `CITATION.cff` file with appropriate details.

6. Set the repository to `Public` visibility once all code and data has been added to the repository and checked.
    - An effective testing strategy is to clone the private repository into a fresh environment, and run through any steps you would normally take to run or verify the code and data.
    - If you are using tools that install or depend on packages such as R or Python, ensure you have tested installing all dependencies from Step 3, ideally in a fresh environment with a new installation of the language.
