# ASC archive-data

The shared material behind every ASC archive interface. Built by the ASC Archives Working Group.

## Handles

| Handle | What it names |
|---|---|
| `item:<10 hex>` | a document, page, article, recording or principle. A hash of what the item is (collection, original link, title, date), so it stays the same between builds |
| `person:<slug>` | a person |
| `place:<slug>` | a place on the map |
| `concept:<slug>` | one of the seven Cybernetics Literacy principles |
| `collection:<slug>` | a collection |

## Files

- `data.json`: everything, for interface sites. Served with `Access-Control-Allow-Origin: *` so any ASC interface can read it.
- `neo4j/nodes.csv`, `neo4j/edges.csv`, `neo4j/load.cypher`: the same graph for Neo4j. Relationships: `PART_OF` (item to collection), `CONTRIBUTED_TO` (person to item, with role), `ABOUT` (item to concept), `HELD_AT` (item to place).

## Notes

- Concept links are found by keyword in titles and texts. They are a first pass and will improve as transcripts and full texts are added.
- Items whose originals contain personal contact details have `withheld: true` and no link, until reviewed.
- Search engines are asked not to index this site.
