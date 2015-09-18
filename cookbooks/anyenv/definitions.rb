define :anyenv_install, prefix: nil do
  env = params[:name]
  prefix = params[:prefix] || "#{Dir.home}/.anyenv/envs"

  execute "install envs" do
    command "anyenv install #{env}"
    not_if %W(test -d #{prefix}/#{env}).shelljoin
  end
end
