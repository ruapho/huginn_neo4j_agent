module Agents
  class Neo4jAgent < Agent

    include FormConfigurable

    can_dry_run!
    no_bulk_receive!
    default_schedule 'never'

    description <<-MD
      Run custom cypher query.

      `connection_url`:

      - from credentials:

          {% credential neo4j_connection %}

      - from string:

          bolt://localhost:7687

      `cypher` - custom cypher query

        MATCH (n) RETURN n.name
    MD

    def default_options
      {
          'connection_url' => 'bolt://localhost:7687',
          'cypher' => 'MATCH (n) RETURN n.name'
      }
    end

    form_configurable :connection_url
    form_configurable :sql, type: :text, ace: { mode: 'cypher', theme: '' }
    
    def validate_options
    end

    def working?
      !recent_error_logs?
    end

#    def check
#    end

#    def receive(incoming_events)
#    end
  end
end
