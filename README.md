## SudokuSecure
[![CodeFactor](https://www.codefactor.io/repository/github/leonthemisfit/sudokusecure/badge)](https://www.codefactor.io/repository/github/leonthemisfit/sudokusecure)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/a6dc735043d246e0b362106777fbe30c)](https://www.codacy.com/app/leonthemisfit/SudokuSecure?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=leonthemisfit/SudokuSecure&amp;utm_campaign=Badge_Grade)

This project is an add-on to my SudokuBoard project. That project has uses the YAML and Marshal libraries in order to load serialized boards. As mentioned on the README for that project, this is insecure and can be dangerous. Those serialization features were not intended for board distribution. This library attempts to bring a little more security to distributing full boards. This is done by creating a signature using an RSA key that can then be verified with the provided public key.

These features are added directly to the Sudoku::Board class found in the SudokuBoard project, so simply import this gem and you're ready to roll with both libraries.

### Warning

While this library provides some additional security on top of the SudokuBoard project it is not meant to fully secure boards. It is possible for people to hide malicious bits of code inside the serialized board just as it is with the base library. The mechanisms used here still require trust in the public RSA keys being used. This provides additional security because you can more easily filter the boards from people you trust and you can verify that the board hasn't been modified since it was signed. 

This library does not provide any mechanisms to check for trusted public keys and as such is still subject to the issues of loading malicious code. **You must use another means of checking trusted RSA keys. If you ignore this warning I am not liable for damages that occur as a result.**