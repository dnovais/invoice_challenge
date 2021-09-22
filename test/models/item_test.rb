require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test 'when all data is empty' do
    # Arrange
    item = Item.new

    # Act
    item.valid?

    # Assert
    assert item.errors.present?

    item_errors = item.errors.as_json.transform_values { |value| value.join(', ') }

    assert_equal("can't be blank", item_errors[:name])
    assert_equal("can't be blank", item_errors[:unit_cost])
    assert_equal("can't be blank", item_errors[:quantity])
  end
end
