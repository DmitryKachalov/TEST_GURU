module BadgesHelper
  def control_collection
    [[I18n.t('helpers.badges_helper.FirstRule'), 'FirstRule'],
     [I18n.t('helpers.badges_helper.CompleteLevelRule'), 'CompleteLevelRule'],
     [I18n.t('.CompleteCategoryRule'), 'CompleteCategoryRule']]
  end
end
