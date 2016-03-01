angular.module('loomioApp').controller 'DiscussionEditedItemController', ($scope) ->
  discussion = $scope.event.discussion()
  version = $scope.event.version()

  $scope.title =
    if version.attributeEdited('title')
      version.changes.title[1]
    else
      ''
  $scope.onlyPrivacyEdited = ->
    version.attributeEdited('private') and
    !version.attributeEdited('title') or
    !version.attributeEdited('description')

  $scope.privacyKey = ->
    return unless version.changes.private[0] != version.changes.private[1]
    if version.changes.private[1]
     'discussion_edited_item.public_to_private'
    else
     'discussion_edited_item.private_to_public'

  $scope.actorName = $scope.event.actorName()

  $scope.translationKey =
    version.editedAttributeNames().join('_')
