import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_check_box.dart';
import 'package:digit_components/widgets/atoms/digit_dropdown.dart';
import 'package:digit_components/widgets/digit_dob_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/localization/app_localization.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

class IndividualDetailsPage extends LocalizedStatefulWidget {
  const IndividualDetailsPage({
    super.key,
    super.appLocalizations,
  });
  @override
  State<IndividualDetailsPage> createState() => _IndividualDetailsPageState();
}

class _IndividualDetailsPageState
    extends LocalizedState<IndividualDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return ScrollableContent(
            header: Column(children: const [
              BackNavigationHelpHeaderWidget(),
            ]),
            footer: Offstage(
              offstage: false,
              child: SizedBox(
                height: 90,
                child: DigitCard(
                  child: DigitElevatedButton(
                    onPressed: () {
                      if (form.valid) {
                        print(form.value);
                      } else {
                        form.markAllAsTouched();
                      }
                    },
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).translate(
                          i18.individualDetails.submitButtonLabelText,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            children: [
              DigitCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      i18.individualDetails.individualsDetailsLabelText,
                      style: theme.textTheme.displayMedium,
                    ),
                    Column(children: [
                      DigitTextFormField(
                        formControlName: 'individualName',
                        label: localizations
                            .translate(i18.individualDetails.nameLabelText),
                      ),
                      DigitCheckBox(
                        checkBoxText: localizations
                            .translate(i18.individualDetails.checkboxLabelText),
                        onChange: () {},
                        isChecked: true,
                      ),
                      DigitTextFormField(
                        formControlName: 'idType',
                        label: localizations
                            .translate(i18.individualDetails.idTypeLabelText),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DigitTextFormField(
                            formControlName: 'idNumber',
                            label: localizations.translate(
                              i18.individualDetails.idNumberLabelText,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            localizations.translate(
                              i18.individualDetails.idNumberSuggestionText,
                            ),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      DigitDobPicker(
                        datePickerFormControl: 'dob',
                        ageInputFormControl: 'age',
                        onChangeDate: (DateTime? dateTime) {},
                        datePickerLabel: localizations
                            .translate(i18.individualDetails.dobLabelText),
                        ageFieldLabel: localizations
                            .translate(i18.individualDetails.ageLabelText),
                        separatorLabel:
                            i18.individualDetails.separatorLabelText,
                      ),
                      BlocBuilder<AppInitializationBloc,
                          AppInitializationState>(builder: (context, state) {
                        return DigitDropDown(
                          label: i18.individualDetails.genderLabelText,
                          initialValue: 'MALE',
                          menuItems: state.appConfiguration != null &&
                                  state.appConfiguration!.genderOptions != null
                              ? state.appConfiguration!.genderOptions!
                                  .map((e) => MenuItemModel(
                                        e.code,
                                        e.name,
                                      ))
                                  .toList()
                              : [],
                          onChanged: (String? newValue) {},
                          formControlName: 'gender',
                        );
                      }),
                      DigitTextFormField(
                        formControlName: 'mobileNumber',
                        label: localizations.translate(
                          i18.individualDetails.mobileNumberLabelText,
                        ),
                      ),
                    ]),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        'individualName': FormControl<String>(value: ''),
        'idType': FormControl<String>(value: ''),
        'idNumber': FormControl<String>(value: ''),
        'dob': FormControl<String>(value: ''),
        'age': FormControl<String>(value: ''),
        'gender': FormControl<String>(value: ''),
        'mobileNumber': FormControl<String>(value: ''),
      });
}
