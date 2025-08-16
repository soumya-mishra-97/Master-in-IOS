// MARK: - SOLID PRINCIPLES
/// S — Single Responsibility Principle (SRP)
/// O — Open/Closed Principle (OCP)
/// L — Liskov Substitution Principle (LSP)
/// I — Interface Segregation Principle (ISP)
/// D — Dependency Inversion Principle (DIP)

// MARK: - Single Responsibility Principle (SRP)
/// One class has one responsbility.
/// If One class has more than one job then it violates the SRP.

/// Violates the SRP. because it hase 2 responsbility
///
/// Bad example SRP - 1
class MultiStorage1{
    /// Responsbility: 1
    func fileStorage(){
        print("File Storage")
    }
    /// Responsbility: 2
    func emailValidation(){
        print("Email Validation")
    }
}

/// Bad example SRP - 2
class MultiStorage2{
    /// Responsbility: 1
    func saveFile() {
        print("Saving to file")
    }
    
    /// Responsbility: 2
    func saveCloud() {
        print("Saving to cloud")
    }
}

/// Good practice of SRP - 1
protocol Storable{
    func fileStorage()
}
protocol Validator{
    func emailValidation()
}

class Storage: Storable{
    func fileStorage(){
        print("File Storage")
    }
}

class Validation: Validator{
    func emailValidation(){
        print("Email Validation")
    }
}

/// Good practice of SRP - 2
/// Each class has a single responsibility: saving to its own target.
protocol DataStorage{
    func save()
}

class FileStorage: DataStorage{
    func save() {
        print("File data saved")
    }
}

class CloudStorage: DataStorage{
    func save(){
        print("Cloud data saved")
    }
}

let fileDB = FileStorage()
fileDB.save()


// MARK: - Open/Closed Principle (OCP)
/// Open for extension, Closed for modification.
/// You can't modify the existing class
///
/// Bad example OCP
/// In this case if you add new method then you modifying the existing class.
class StoreData{
    func store(using db: String){
        if db == "SQL"{
           print("SQL")
        }else if db == "Cloud"{
            print("SQL")
        }
    }
}

/// Good practice of OCP
/// Here you can add the new method like FileDB without modifying existing logic.
protocol StorableData{
    func store()
}

class SQLDB: StorableData{
    func store() {
        print("SQL DB")
    }
}

class CloudDB: StorableData{
    func store() {
        print("Cloud DB")
    }
}

class StorageProcessor{
    func process(using data: StorableData){
        data.store()
    }
}

let store = StorageProcessor()
store.process(using: SQLDB())

// MARK: - Liskov Substitution Principle (LSP)
/// Subclasses should be behave like Baseclass
/// Like if you have 2 class , Class A and Class B.
/// You should be replace A with B without breaking the original code.
///
/// Bad example LSP
/// In this code LSP violates,because this StorageWDT class only supports write data not read data,
/// So if i conforming the ReadStorageWDT then the crashed happned. because it's not svaing data , it's only read the data.
class StorageWDT{
    func write(){
        print("Write data")
    }
}

class FileStorageWDT: StorageWDT{
    override func write() {
        print("File storage write data")
    }
}

class CloudStorageWDT: StorageWDT{
    override func write() {
        print("Cloud storage write data")
    }
}

class ReadStorageWDT: StorageWDT{
    override func write() {
        fatalError("Read data")
    }
}

class UserPersistance{
    func persist(using storage: StorageWDT){
        storage.write()
    }
}

let persist = UserPersistance()
/// Crashed
// persist.persist(using: ReadStorageWDT())

/// Good example LSP
/// In this case WriteStorage & ReadStorage purpsoe is read and write the data
protocol WriteStorage{
    func write()
}

protocol ReadStorage{
    func read()
}

class FileStorageWT: WriteStorage{
   func write() {
        print("File write data")
    }
}

class CloudStorageRT: ReadStorage{
    func read() {
        print("Cloud read data")
    }
}

/// if you wnat both read&write staorage both then use typealias
typealias ReadWriteStorage = WriteStorage & ReadStorage

class APIStorageWRT: ReadWriteStorage{
    func write() {
        print("API write data")
    }
    
    func read() {
        print("API read data")
    }
}

class Persistance{
    func writePersist(using storage: WriteStorage){
        storage.write()
    }
    
    func readPersist(using storage: ReadStorage){
        storage.read()
    }
    
    func readWriteStorage(using storage: ReadWriteStorage){
        storage.read()
        storage.write()
    }
}

let pdt = Persistance()
pdt.writePersist(using: FileStorageWT())
pdt.readPersist(using: CloudStorageRT())
pdt.readWriteStorage(using: APIStorageWRT())

// MARK: - Interface Segregation Principle (ISP)
