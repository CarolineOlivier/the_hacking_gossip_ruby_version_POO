require_relative 'lib/router'  # Charge le fichier router.rb depuis le dossier lib, où la classe Router est définie.


# Lancement de l'application 
Router.new.perform # Router.new : Crée une nouvelle instance de la classe Router 
# et .perform : appelle la méthode perform de l'instance router, qui démarre le processus de routage de l'application.
