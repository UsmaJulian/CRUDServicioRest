
import 'package:crudserviciosrest/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
	final _emailController = BehaviorSubject<String>();
	final _passworController = BehaviorSubject<String>();
	
	//RECUPERAR LOS DATOS DEL STREAM
	Stream<String> get emailStream =>
			_emailController.stream.transform(validarEmail);
	Stream<String> get passwordStream =>
			_passworController.stream.transform(validarPassword);
	
	Stream<bool> get formValidStream =>
			CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);
	
	//INSERTAR VALORES AL STREAM
	Function(String) get changeEmail => _emailController.sink.add;
	Function(String) get changePassword => _passworController.sink.add;
	
	//OBTENER EL ULTIMO VALOR INGRESADO EN LO STREAMS
	String get email => _emailController.value;
	String get password => _passworController.value;
	
	dispose() {
		_emailController?.close();
		_passworController?.close();
	}
}