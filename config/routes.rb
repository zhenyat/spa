Rails.application.routes.draw do
  if MULTILINGUAL
    scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
      root 'site#index'
    end

    # Root route is directed to default locale
    root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

    # All other routes without locales are directed to the same ones with locales
    get "/*path", to: redirect("/#{I18n.default_locale}/%{path}", status: 302), constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false

  else
    root 'site#index'
  end
end
