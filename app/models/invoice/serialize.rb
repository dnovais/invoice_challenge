# frozen_string_literal: true

module Invoice::Serialize
  AsJson = ->(invoice) do
    invoice.as_json(include: [:company, :client, :items] )
  end

  def self.as_json(invoice)
    AsJson[invoice]
  end
end
