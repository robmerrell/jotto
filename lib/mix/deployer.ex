defmodule Mix.Tasks.Deployer do

  defmodule Build do
    use Mix.Task

    @shortdoc "Build the project inside of a vm using vargrant"

    @moduledoc """
    Use exrm to build a release. The release is built in a vagrant vm that is expected
    to already be running and set up. At this time exrm requires that the server's config
    be replicated in the build environment, so config/prod_env is not committed to the repo
    but expected to be present and with environment variables that match the target server
    using dotenv syntax.
    """

    def run(_) do
      Deployer.run_vagrant_cmd! "mix local.hex --force"
      Deployer.run_vagrant_cmd! "yes | mix deps.get"
      Deployer.run_vagrant_cmd! "mix release"
    end
  end

  defmodule Deploy do
    use Mix.Task

    @shortdoc "Deploy the build artifacts to the server and upgrade"

    @moduledoc """
    Deploys the build artifacts generated by the Build Deployer.build mix task. Deployment
    consists of:
      1) Copying and untarring the release file
      2) Symlinking the 'latest' directory to the release
      3) Running the upgrade command
    """

    def run(_) do
      version = String.strip(File.read!("VERSION"))
      remote = "freebsd@robdor.com"
      remote_dir = "/home/freebsd/deployments/jotto.robdor.com"

      Deployer.scp! "rel/jotto/jotto-#{version}.tar.gz", remote_dir, remote
      Deployer.run_ssh_cmd! "mkdir -p #{version}", remote, remote_dir
      Deployer.run_ssh_cmd! "tar xvfz jotto-#{version}.tar.gz -C ./#{version}", remote, remote_dir
      Deployer.run_ssh_cmd! "ln -s #{version} latest", remote, remote_dir
    end
  end

end