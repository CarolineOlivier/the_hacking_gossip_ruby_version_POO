#Controller
#|   ├── Gère les actions de l'utilisateur
#|   ├── Appelle les méthodes du Model pour manipuler les données
#|   └── Met à jour la View en conséquence


#Le controller servira de relai entre la view et le model.
#Le Controller appelle les méthodes de la View pour demander des entrées, afficher les résultats, ou confirmer les actions effectuées.

# Il aura 3 méthodes : 
# une qui gère la création d'un potin, 
# une qui gère l'affichage de la liste des potins, 
# et une qui permet de détruire un potin. 
# Une fois l'action effectuée (via le model), la méthode devra renvoyer vers la view.

require_relative 'gossip'
require_relative 'view'

class Controller
  def initialize
    @view = View.new # Création d'une instance de la classe View pour gérer les interactions avec l'utilisateur
  end

  # Méthode pour gérer la création d'un nouveau gossip
  def create_gossip 
    author = @view.ask_for_author # Cette ligne appelle la méthode ask_for_author de la classe View,
    #qui va afficher un message demandant à l'utilisateur de saisir le nom de l'auteur, puis récupérer cette entrée via le terminal.
    content = @view.ask_for_content # cette ligne appelle la méthode ask_for_content de la View,
     #qui demande à l'utilisateur de saisir le contenu du gossip, puis enregistre cette saisie.

       # Crée un nouvel objet Gossip avec les données fournies
    gossip = Gossip.new(author, content)

    # Sauvegarde le gossip dans le fichier JSON via la méthode save du modèle Gossip
    gossip.save

    # Informe l'utilisateur que le gossip a été créé avec succès
    @view.confirm_creation
  end

  # Méthode pour afficher la liste des gossips
  def index_gossips
    # Récupère tous les gossips à partir du modèle
    gossips = Gossip.all

    # Affiche la liste des gossips via la View
    @view.display_gossips(gossips)
  end

  # Méthode pour supprimer un gossip
  def delete_gossip
    # Récupère tous les gossips actuels pour les afficher
    gossips = Gossip.all
    @view.display_gossips(gossips)

    # Demande à l'utilisateur quel gossip il souhaite supprimer
    index = @view.ask_for_index_to_delete

    # Supprime le gossip à l'index choisi via le modèle Gossip
    Gossip.delete(index)

    # Informe l'utilisateur que le gossip a été supprimé
    @view.confirm_deletion
  end
end
