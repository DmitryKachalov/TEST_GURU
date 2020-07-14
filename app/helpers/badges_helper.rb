module BadgesHelper
  def control_collection
    BadgeControlService::RULE_TYPES.map { |control| [t("helpers.badges_helper.#{control}"), control]}
  end
end
