app.directive('cdPwdMatch', ['$compile', function ($compile) {
    return {
        require: 'ngModel',
        restrict: 'A',
        link: function (scope, element, attrs, ctrl) {
            var targetName = attrs['cdPwdMatch'];

            if (!targetName) {
                console.log("No match target is set for cdPwdMatch");
                return;
            }

            var toMatch = $('#' + targetName);
            if (!toMatch.length) {
                toMatch = $('[name=' + targetName + ']');
            }

            if (!toMatch.length) {
                console.log("Could not found the target by its id or name");
                return;
            }

            if (toMatch.length > 1) {
                console.log("Multiple targets were found by its id or name, please make it unique");
                return;
            }

            ctrl.$validators.cdPwdMatch = function (modelValue) {
				
				if(!modelValue)
					return true;
				
                return toMatch.val() === modelValue;
            };
			
			scope.$watch(toMatch.attr('ng-model'), function(){
				ctrl.$validate();
			});

            toMatch.on('keydown', function (event) {
                element.addClass('editting');
				scope.$apply(function(){
					ctrl.$editting = true;
				});
            });

            toMatch.on('blur', function () {
                element.removeClass('editting');
				scope.$apply(function(){
					ctrl.$editting = false;
				});
            });
        }
    };
}])
.directive('cdValidation', ['$compile', function ($compile) {
    return {
        restrict: 'A',
		require: 'ngModel',
        link: function (scope, element, attrs, ctrl) {

            var dom = element[0];
            var formName = dom.form.name;
            var name = dom.name;
			
			// TODO: Validate the form name and input name.

            var container = $('<div class="error-msg-container"></div>');
            container.attr('ng-show', formName + '.$submitted || ' + formName + '.' + name +'.$touched');

            var validations = {
                'required': 'Required.',
                'pattern': 'Pattern not match.',
                'minlength': 'The minimum length is [val].',
                'maxlength': 'The maximum length is [val].',
                'min': 'The minimum value is [val].',
                'max': 'The maximum value is [val].',

                // Customized validation
                'cdPwdMatch': 'Confirm password doesn\'t match.',
            };

            for (var key in validations) {

                var attrName = key;
                if (attrs[attrName]) {
                    var errorAttrName = attrs.$normalize('error-' + attrName);

                    var message = attrs[errorAttrName] || validations[key];
                    message = message.replace('[val]', "" + attrs[attrName]);

                    container.append('<span ng-show="!' + formName + '.' + name + '.$editting && ' + formName + '.' + name + '.$error.' + key + '">' + message + '</span>');
                }
            }

            $compile(container)(scope, function (clone, scople) {
                element.parent().append(clone);
            });
			
            element.on('keydown', function (event) {
                element.addClass('editting');
				scope.$apply(function(){
					ctrl.$editting = true;
				});
            });

            element.on('blur', function () {
                element.removeClass('editting');
				scope.$apply(function(){
					ctrl.$editting = false;
				});
            });
        }
    };
}]);