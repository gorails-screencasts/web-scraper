namespace :pages do
  desc "Runs checks for all pages"
  task run_checks: :environment do
    Page.find_each(&:check_and_notify)
  end
end