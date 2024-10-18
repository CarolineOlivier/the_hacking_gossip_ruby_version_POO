#└── Model (Gossip)
#    ├── Interagit avec la base de données (fichier JSON)
#    ├── Attributs : `content`, `author`
#    ├── Peut lire, ajouter ou supprimer des potins dans le fichier JSON
#    └── Fournit des instances de Gossip à partir des données du JSON

#Le model et la base de données : le model sera une classe `Gossip` qui ira piocher dans la base de données (le JSON) 
# et sortira des instances de type `Gossip`.
# DONC :  Le modèle Gossip gère les données, et la View s'assure que les informations sont présentées de manière lisible et conviviale.
# Chaque gossip est constitué de deux attributs principaux cad 2 variables d'instance : un `content` et un `author`.

#1. **Content** : Le contenu du potin, c'est-à-dire le texte ou la rumeur que l'utilisateur souhaite partager.
 # son `content` qui est un string
#2. **Author** : Le nom de l'auteur du potin, qui peut être n'importe quel nom ou pseudonyme que l'utilisateur choisit.
 # un `author` qui est aussi un string



 require 'json'

 class Gossip
   attr_reader :content, :author
 
   # Méthode d'initialisation pour créer un nouvel objet Gossip
   def initialize(author, content)
     @content = content.to_s  # La méthode .to_s est utilisée pour convertir explicitement les arguments author et content en chaînes de caractères
     @author = author.to_s    # Ainsi, même si un autre type de donnée est passé, il sera converti en string.
     # Cela garantit que les attributs @content et @author seront toujours des strings.
   end
 
   public # Ceci force les méthodes qui suivent à être publiques
 
   # Méthode pour sauvegarder un nouveau gossip dans le fichier JSON
   def save
     gossips = Gossip.all # Récupère tous les gossips existants en appelant la méthode 'Gossip.all'
 
     # Ajoute un nouveau gossip sous forme de hash au tableau 'gossips'
     # Le hash contient deux clés : "author" et "content", qui stockent les valeurs des attributs d'instance '@author' et '@content'
     gossips << { "author" => @author, "content" => @content }
 
     # Écrit le tableau de gossips mis à jour dans le fichier 'db/gossip.json'
     # 'JSON.pretty_generate(gossips)' formate les données en JSON de manière lisible
     File.write('db/gossip.json', JSON.pretty_generate(gossips))
   end
 
   # Méthode de classe pour récupérer tous les gossips depuis le fichier JSON
   def self.all
     # Définit le chemin du fichier contenant les gossips
     file = 'db/gossip.json'
 
     # Vérifie si le fichier existe et n'est pas vide
     # 'File.exist?(file)' retourne 'true' si le fichier existe
     # '!File.zero?(file)' vérifie que le fichier n'est pas vide (sa taille n'est pas zéro)
     # Si l'une de ces conditions n'est pas remplie, la méthode retourne un tableau vide
     return [] unless File.exist?(file) && !File.zero?(file)
 
     # Lit le contenu du fichier JSON et le convertit en un tableau Ruby à l'aide de 'JSON.parse'
     JSON.parse(File.read(file))
   end
 
   # Méthode de classe pour supprimer un gossip par son index
   def self.delete(index)
     # Récupère tous les gossips existants en appelant la méthode 'Gossip.all'
     gossips = Gossip.all
 
     # Supprime le gossip à l'index spécifié, en ajustant l'index pour correspondre à l'index humain (commence à 1)
     # 'index - 1' convertit l'index humain en index de tableau (qui commence à zéro)
     gossips.delete_at(index - 1)
 
     # Écrit le tableau de gossips mis à jour dans le fichier 'db/gossip.json' après la suppression
     File.write('db/gossip.json', JSON.pretty_generate(gossips))
   end
 end
 
