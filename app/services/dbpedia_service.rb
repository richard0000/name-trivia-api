require 'sparql/client'

class DbpediaService
  DBPEDIA_ENDPOINT = 'http://dbpedia.org/sparql'

  def self.get_famous_people_by_name(name)
    sparql = SPARQL::Client.new(DBPEDIA_ENDPOINT)

    query = <<-SPARQL
      PREFIX foaf: <http://xmlns.com/foaf/0.1/>
      PREFIX dbo: <http://dbpedia.org/ontology/>
      SELECT DISTINCT ?person ?name
      WHERE {
        ?person foaf:name ?name .
        FILTER(STRSTARTS(STR(?name), "#{name}"))
      }
      LIMIT 10
    SPARQL

    results = sparql.query(query)
    results.map { |result|
      {
        name: result[:name].to_s,
        link: result[:person].to_s
      }
    }
  end
end
