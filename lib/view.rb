#├── View
#|   ├── Affiche les informations à l'utilisateur
#|   ├── Collecte les entrées de l'utilisateur avec `puts` et `gets.chomp`
#|   └── Envoie les données au Controller

# La View interagit avec l'utilisateur en affichant les informations et en collectant les entrées, puis transmet ces données au Controller.
# on va coder ça sur le terminal avec des bons vieux `puts` en l'affichage et `gets.chomp` pour obtenir les ordres de l'utilisateur.

class View
    def ask_for_author #Affiche un message demandant à l'utilisateur de saisir le nom de l'auteur du gossip
      puts "Quel est le nom de l'auteur du gossip ?"
      print "> "
      gets.chomp #Utilise gets.chomp pour capturer l'entrée de l'utilisateur.
    end
  
    # Demande à l'utilisateur de saisir le contenu du gossip
    def ask_for_content
      puts "Quel est le contenu du gossip ?"
      print "> "
      gets.chomp # Retourne l'entrée utilisateur
    end
  
    # Affiche la liste des gossips
    def display_gossips(gossips)  # Reçoit un tableau de gossips (chargés depuis le fichier JSON via le modèle Gossip).
      puts "Voici la liste des gossips :" # Affiche chaque gossip avec son numéro, l'auteur et le contenu.
      gossips.each_with_index do |gossip, index| #Le each_with_index permet d'indiquer un numéro pour chaque gossip, en commençant à 1.
        puts "#{index + 1}. #{gossip['author']} a dit : #{gossip['content']}"
      end
    end
  
    # Demande à l'utilisateur de spécifier le numéro du gossip à supprimer.
    def ask_for_index_to_delete
      puts "Quel gossip souhaitez-vous supprimer ? (Indiquez le numéro)"
      print "> "
      gets.chomp.to_i # Utilise gets.chomp.to_i pour capturer l'entrée de l'utilisateur et la convertir en entier.
    end
  
    def confirm_creation #messages pour informer l'utilisateur du succès de l' actions de création 
      puts "Le gossip a été créé avec succès !"
    end
  
    def confirm_deletion #messages pour informer l'utilisateur du succès de l' actions de suppression.
      puts "Le gossip a été supprimé avec succès !"
    end
  end
  