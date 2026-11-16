// Load the ASC archive into Neo4j (5.x). Put nodes.csv and edges.csv in the import folder.
CREATE CONSTRAINT handle_unique IF NOT EXISTS FOR (n:Node) REQUIRE n.handle IS UNIQUE;
LOAD CSV WITH HEADERS FROM 'file:///nodes.csv' AS r
CALL apoc.merge.node(['Node', r.label], {handle: r.handle},
  {name: r.name, year: toInteger(r.year), type: r.type, url: r.url, withheld: r.withheld = 'true',
   lat: toFloat(r.lat), lon: toFloat(r.lon), extra: r.extra}, {}) YIELD node RETURN count(node);
LOAD CSV WITH HEADERS FROM 'file:///edges.csv' AS r
MATCH (a:Node {handle: r.from}), (b:Node {handle: r.to})
CALL apoc.merge.relationship(a, r.type, {}, {role: r.role}, b, {}) YIELD rel RETURN count(rel);
// Without APOC: load each label and relationship type with its own MERGE statement.
