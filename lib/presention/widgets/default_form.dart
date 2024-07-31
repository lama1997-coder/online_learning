part of 'widget_import.dart';

class DefaultForm extends StatelessWidget {
  final String? title;
  final TextInputType? inputType;
  final bool? isPassword;
  final bool? haveTitle;
  final TextEditingController? controller;
  final Widget? icon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final List<TextInputFormatter>? inputFormatters;

  DefaultForm(
      {super.key, this.title,
      this.inputType,
      this.isPassword,
      this.controller,
      this.validator,
      this.icon,
      this.haveTitle,
      this.onChange,
      this.inputFormatters, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        haveTitle ?? true
            ? DefaultText(
                title: title ?? "",
                size: 16,
                fontWeight: FontWeight.bold,
              )
            : SizedBox(
                height: 5,
              ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
            controller: controller ?? TextEditingController(),
            keyboardType: inputType ?? TextInputType.text,
            obscureText: isPassword ?? false,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
                suffixIcon: icon,
                prefix: prefixIcon,
                floatingLabelBehavior:
                    FloatingLabelBehavior.never, // Ensure label stays on top

                labelText: title ?? "Hi",
                alignLabelWithHint: true, // Insert this line
                // floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: ThemeDataProvider.borderColor, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                        color: ThemeDataProvider.backgroundDarkColor,
                        width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: ThemeDataProvider.textWrongColor))),
            validator: validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter ' + (title ?? "value");
                  }
                  return null;
                },
            onChanged: onChange),
      ],
    );
  }
}
