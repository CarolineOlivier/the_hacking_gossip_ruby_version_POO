#├── Router
#|   ├── Prend les entrées de l'utilisateur
#|   └── Route vers les méthodes du Controller (==créer, voir, supprimer un potin==)

# Le travail du routeur sera simple :
 # c'est de demander ce que l'utilisateur veut faire et de lancer la bonne méthode dans la bonne classe, en fonction.  
  
# Il y aura 3 choix : créer un gossip,
#  voir la liste complète des gossips 
#  ou supprimer un gossip. 
#  Chaque action correspond à une méthode du controller.

require_relative 'controller'

class Router
  def initialize
    @controller = Controller.new  # Création d'une instance du Controller
  end

  def perform
    puts "Bienvenue dans The Gossip Project !"

    # Boucle principale du router
    while true # La boucle while true présente les choix possibles (créer, voir, supprimer un gossip ou quitter l'application).
      # Affichage du menu : 
      puts "Que veux-tu faire ?"
      puts "1. Ajouter un potin"
      puts "2. Voir tous les potins"
      puts "3. Supprimer un potin"
      puts "4. Quitter l'application"
      print "> "

      # Récupére le choix de l'utilisateur
      choice = gets.chomp.to_i

      # En fonction du choix, appeler la méthode correspondante du controller
      case choice
      when 1
        @controller.create_gossip  # déclenche la méthode pour créer un nouveau potin.
      when 2
        @controller.index_gossips # affiche la liste complète des potins.
      when 3
        @controller.delete_gossip # supprime un potin spécifique
      when 4
        puts "À bientôt !" # quitter la boucle et donc l'application
        break
      else
        puts "Choix non valide, merci de réessayer."  #Le menu est affiché à chaque itération, 
        # et le programme vérifie la validité de l'entrée (si ce n'est pas un choix valide, il demande de réessayer).
      end
    end
  end
end
