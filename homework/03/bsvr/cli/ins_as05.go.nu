  1: package cli
  2: 
  3: import (
  4:     "encoding/hex"
  5:     "fmt"
  6: 
  7:     "github.com/ethereum/go-ethereum/common"
  8:     "github.com/ethereum/go-ethereum/crypto"
  9: )
 10: 
 11: func (cc *CLI) InstructorValidateSignature(addr, sig, msg string) (isValid bool, err error) {
 12:     _, _, err = VerifySignature(addr, sig, msg) // (recoveredAddress, recoveredPublicKey string, err error) {
 13:     if err != nil {
 14:         return // isValid is false.
 15:     }
 16: 
 17:     return true, nil
 18: }
 19: 
 20: // VerifySignature takes hex encoded addr, sig and msg and verifies that the signature matches with the address.
 21: // Pulled form go-ethereum code.
 22: func VerifySignature(addr, sig, msg string) (recoveredAddress, recoveredPublicKey string, err error) {
 23:     message, err := hex.DecodeString(msg)
 24:     if err != nil {
 25:         return "", "", fmt.Errorf("unabgle to decode message (invalid hex data) Error:%s", err)
 26:     }
 27:     if !common.IsHexAddress(addr) {
 28:         return "", "", fmt.Errorf("invalid address: %s", addr)
 29:     }
 30:     address := common.HexToAddress(addr)
 31:     signature, err := hex.DecodeString(sig)
 32:     if err != nil {
 33:         return "", "", fmt.Errorf("signature is not valid hex Error:%s", err)
 34:     }
 35: 
 36:     recoveredPubkey, err := crypto.SigToPub(signHash(message), signature)
 37:     if err != nil || recoveredPubkey == nil {
 38:         return "", "", fmt.Errorf("signature verification failed Error:%s", err)
 39:     }
 40:     recoveredPublicKey = hex.EncodeToString(crypto.FromECDSAPub(recoveredPubkey))
 41:     rawRecoveredAddress := crypto.PubkeyToAddress(*recoveredPubkey)
 42:     if address != rawRecoveredAddress {
 43:         return "", "", fmt.Errorf("signature did not verify, addresses did not match")
 44:     }
 45:     recoveredAddress = rawRecoveredAddress.Hex()
 46:     return
 47: }
 48: 
 49: // VerifySignature takes hex encoded addr, sig and msg and verifies that the signature matches with the address.
 50: // Pulled form go-ethereum code.
 51: func VerifySignature2(addr, sig, msg string) (recoveredAddress, recoveredPublicKey string, err error) {
 52:     message, err := hex.DecodeString(msg)
 53:     if err != nil {
 54:         return "", "", fmt.Errorf("unabgle to decode message (invalid hex data) Error:%s", err)
 55:     }
 56:     if !common.IsHexAddress(addr) {
 57:         return "", "", fmt.Errorf("invalid address: %s", addr)
 58:     }
 59:     address := common.HexToAddress(addr)
 60:     signature, err := hex.DecodeString(sig)
 61:     if err != nil {
 62:         return "", "", fmt.Errorf("signature is not valid hex Error:%s", err)
 63:     }
 64: 
 65:     recoveredPubkey, err := crypto.SigToPub(signHash(message), signature)
 66:     if err != nil || recoveredPubkey == nil {
 67:         return "", "", fmt.Errorf("signature verification failed Error:%s", err)
 68:     }
 69:     recoveredPublicKey = hex.EncodeToString(crypto.FromECDSAPub(recoveredPubkey))
 70:     rawRecoveredAddress := crypto.PubkeyToAddress(*recoveredPubkey)
 71:     if address != rawRecoveredAddress {
 72:         return "", "", fmt.Errorf("signature did not verify, addresses did not match")
 73:     }
 74:     recoveredAddress = rawRecoveredAddress.Hex()
 75:     return
 76: }
 77: 
 78: // signHash is a helper function that calculates a hash for the given message
 79: // that can be safely used to calculate a signature from.
 80: //
 81: // The hash is calulcated as
 82: //   keccak256("\x19Ethereum Signed Message:\n"${message length}${message}).
 83: //
 84: // This gives context to the signed message and prevents signing of transactions.
 85: func signHash(data []byte) []byte {
 86:     msg := fmt.Sprintf("\x19Ethereum Signed Message:\n%d%s", len(data), data)
 87:     return crypto.Keccak256([]byte(msg))
 88: }
