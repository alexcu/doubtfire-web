angular.module('doubtfire.tasks.task-ilo-alignment.modals.task-ilo-batch-alignment-modal', [])

#
# Shows a modal where users can align tasks to ILOs
#
.factory('TaskILOBatchAlignmentModal', ($modal) ->
  TaskILOBatchAlignmentModal = {}

  TaskILOBatchAlignmentModal.show = (task, unit, alignments, source) ->
    $modal.open({
      controller: 'TaskILOBatchAlignmentModalCtrl'
      templateUrl: 'tasks/task-ilo-alignment/modals/task-ilo-batch-alignment-modal/task-ilo-batch-alignment-modal.tpl.html'
      size: 'lg'
      backdrop: 'static'
      resolve: {
        task: -> task
        source: -> source
        unit: -> unit
        alignments: -> alignments
      }
    })

  TaskILOBatchAlignmentModal
)

.controller('TaskILOBatchAlignmentModalCtrl', ($scope, $modalInstance, task, source, unit, alignments) ->
  $scope.task = task
  $scope.source = source
  $scope.ilos = unit.ilos
  $scope.alignments = alignments
  $scope.alignments ?= {}
  # Need to ensure alignments contains ILOs
  _.each($scope.ilos, (ilo) ->
    $scope.alignments[ilo.id] ?= { rating: 0, intended_learning_outcome_id: ilo.id }
  )
  $scope.updateAlignments = ->
    console.log($scope.alignments)
    $modalInstance.close($scope.alignments)
)
