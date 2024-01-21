class BranchItemController < ApplicationController
    def self.get_details(branch_id, item_id)
        @branch_item = BranchItem.find_by(branch_id: branch_id, item_id: item_id)
        return @branch_item
    end
end
