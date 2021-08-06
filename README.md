**Repositorio de Automatización de Pruebas UAT de Ripley.com**

# Introducción

Cucumber es una herramienta de automatización de pruebas para BDD basada en el lenguaje Ruby. Si buscas más información sobre Ruby aquí te compartimos un enlace:

> Tutorial de Ruby en Español (http://www.pmoinformatica.com/p/tutorial-de-ruby-on-rails-en-espanol.html)

La metodología de trabajo de Cucumber es la siguiente:

El usuario describe el comportamiento del sistema usando un lenguaje “natural” (Gherkin), que contiene palabras clave específicas.
Primero se crea un archivo de funcionalidad (Feature), en el cual se describe una característica del sistema y algunos escenarios de pruebas de software.
De por sí, Cucumber no sabe cómo interpretar estas funcionalidades. Por lo tanto, el siguiente paso es desarrollar las definiciones de pasos (Step Definitions) en Ruby.
Tiene mucha flexibilidad en la forma en que los pasos de prueba pueden ejecutarse. Por ejemplo, puede tomar definiciones de pasos de Webrat, una herramienta de pruebas de aceptación para Ruby, que puede simular un navegador (sin soporte a JavaScript).
También puede combinarse con una herramienta de automatización de pruebas como Watir, para implementar pruebas automatizadas basadas en web.

---

# Installation

## SOFTWARE VERSIONS
These instructions have been tested on Windows 10 64-bit, but should also work on Windows 7 and 8.1. We’ll be using the 64-bit versions of software where we can, but if you are running a 32-bit system you can install the 32-bit versions instead. But you should probably upgrade! I also assume that you have installed Firefox already, if not you can get Firefox here.

## STEP 1: INSTALL RUBY
Since Windows does not have a fancy package manager installed by default, like OSX or most Linux distributions, we will have to install Ruby with the RubyInstaller that you can find here. We are going to install the 64-bit version of Ruby 2.4.2. Download the Ruby 2.4.2-2 (x64).exe file, run it, and follow these steps:

1) Click ‘I accept the License’ and click ‘Next’.
2) Make sure ‘Add Ruby executables to your PATH’ and ‘Associate .rb and .rbw files with this Ruby installation’ are selected, and click ‘Install’.
3) Let the Installer run, when it’s finished, make sure ‘Run ‘ridk install’…….’ is selected and click ‘Finish’.
4) You should get to this screen, where you can press ENTER:
5) Now you’ll get to the installer for MSYS2, which we’ll need for a couple of functions in Ruby. Click ‘Next’.
6) Click ‘Next’.
7) Click ‘Next’ and let the installer finish.
8) Once the MSYS2 installer has finished, uncheck ‘Run MSYS now.’ and click ‘Finish’.
9) Ruby is now installed.

## STEP 2: INSTALL CHROME AND FIREFOX DRIVERS.
In order to let Cucumber and Watir start and control the browser, we have to install ChromeDriver and GeckoDriver. Watir will use ChromeDriver and GeckoDriver to load websites and perform actions on those websites. ChromeDriver will do this if we want to use the Chrome browser, and GeckoDriver will do this when we decide to use Firefox for our tests.

1) Download the latest version of geckodriver here.
2) Download the latest version of ChromeDriver here.
3) Extract both zip files to ‘C:\Ruby24-x64\bin’, or where else you’ve installed Ruby.

## STEP 3: INSTALL BUNDLER
In order to get our first automated test suite set up fully, we have to install the Rubygem, Bundler:

 Type ‘gem install bundler’ and wait until the installation is complete. 

## STEP 4: CLONE REPOSITORY

Use these steps to clone from SourceTree, our client for using the repository command-line free. Cloning allows you to work on your files locally. If you don't yet have SourceTree, [download and install first](https://www.sourcetreeapp.com/). If you prefer to clone from the command line, see [Clone a repository](https://confluence.atlassian.com/x/4whODQ).

1. You’ll see the clone button under the **Source** heading. Click that button.
2. Now click **Check out in SourceTree**. You may need to create a SourceTree account or log in.
3. When you see the **Clone New** dialog in SourceTree, update the destination path and name if you’d like to and then click **Clone**.
4. Open the directory you just created to see your repository’s files.

Now that you're more familiar with your Bitbucket repository, go ahead and add a new file locally. You can [push your change back to Bitbucket with SourceTree](https://confluence.atlassian.com/x/iqyBMg), or you can [add, commit,](https://confluence.atlassian.com/x/8QhODQ) and [push from the command line](https://confluence.atlassian.com/x/NQ0zDQ).

## STEP 5: INSTALL GEMFILE with bundle install

bundle-install - Install the dependencies specified in your Gemfile

Install the gems specified in your Gemfile(5). If this is the first time you run bundle install (and a Gemfile.lock does not exist), Bundler will fetch all remote sources, resolve dependencies and install all needed gems.

If a Gemfile.lock does exist, and you have not updated your Gemfile(5), Bundler will fetch all remote sources, but use the dependencies specified in the Gemfile.lock instead of resolving dependencies.

If a Gemfile.lock does exist, and you have updated your Gemfile(5), Bundler will use the dependencies in the Gemfile.lock for all gems that you did not update, but will re-resolve the dependencies of gems that you did update. You can find more information about this update process below under CONSERVATIVE UPDATING.


---