namespace :config do
  desc "Copy the config of the active admin poro decorator"
  task :copy do
    source = File.join(Gem.loaded_specs["activeadmin-poro-decorator"].full_gem_path, "activeadmin-poro-decorator.yml.example")
    target = File.join(Rails.root, "config", "activeadmin-poro-decorator.yml.example")
    FileUtils.cp_r source, target
  end
end