// extension ToJsonExtension<T extends Object> on T {
//   Map<String, dynamic> toJson() {
//     if (this is Map<String, dynamic>) {
//       return this as Map<String, dynamic>;
//     }
//
//     final Map<String, dynamic> json = {};
//     try {
//       final instanceMirror = reflect(this);
//       instanceMirror.type.declarations.forEach((key, value) {
//         if (value is VariableMirror && !value.isStatic) {
//           json[MirrorSystem.getName(key)] = instanceMirror.getField(key).reflectee;
//         }
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//     return json;
//   }
// }