namespace :dev do

DEFAULT_PASSWORD = 123456

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
    puts ("Apagando BD...") { %x(rails db:drop) }
    puts ("Apagando BD...") { %x(rails db:create) }
    puts ("Apagando BD...") { %x(rails db:migrate) }
    puts ("Cadastrando o administrador padrão..") { %x(rails dev:add_default_admin) }
    puts ("Cadastrando o administradores extras..") { %x(rails dev:add_extra_admin) }
    puts ("Cadastrando o usuário padrão..") { %x(rails dev:add_default_user) }

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

##adiciona administradores extras
desc "Adiciona o administrador padrão"
task add_extra_admin: :environment do
  10.times do |i|
Admin.create!(
email: Faker::Internet.email,
password: DEFAULT_PASSWORD,
password_confirmation: DEFAULT_PASSWORD
)
end
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