module BadgesHelper
  def control_collection
    [[I18n.t('helpers.badges_helper.FirstRule'), :all_in_category],
     [I18n.t('helpers.badges_helper.CompleteLevelRule'), :first_try],
     [I18n.t('helpers.badges_helper.CompleteCategoryRule'), :all_in_level]]
  end
end
