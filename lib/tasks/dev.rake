namespace :dev do

DEFAULT_PASSWORD = 123456

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
    show_spinner("Apagando BD...") { %x(rails db:drop) }
    show_spinner("Apagando BD...") { %x(rails db:create) }
    show_spinner("Apagando BD...") { %x(rails db:migrate) }
    show_spinner("Cadastrando o administrador padrão..") { %x(rails dev:add_default_admin) }
    show_spinner("Cadastrando o usuário padrão..") { %x(rails dev:add_default_user) }

    #%x(rails dev:add_mining_types)
    else
      puts "Você não está em ambiente de desenvolvimento" 
      end
end 

##task Administrador
desc "Adiciona o administrador padrão"
task add_default_admin: :environment do
Admin.create!(
email: 'admin@admin.com',
password: DEFAULT_PASSWORD,
password_confirmation: DEFAULT_PASSWORD
)
end
##task Usuário padrão

desc "Adiciona o usuário padrão"
task add_default_user: :environment do
User.create!(
email: 'user@user.com',
password: DEFAULT_PASSWORD,
password_confirmation: DEFAULT_PASSWORD
)
end

private

def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:sippner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner_sucess("{msg_end})")
  end
end