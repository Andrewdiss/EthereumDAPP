pragma solidity ^0.4.11;

contract toTest{
    uint[] numList;

    mapping (uint => someStorage) storageData;

    struct someStorage{
        uint indexInLi;
        string name;
        uint age;
    }


    function AddStore(uint storeNum, string name, uint age) external returns(bool itsOkay){
        var addStore = someStorage(
            numList.push(storeNum) - 1,
            name,
            age);

        storageData[storeNum] = addStore;
        return true;
    }


    function getStoreLen() view public returns(uint){
        return numList.length;
    }

    function getStorage(uint storeNum) view public returns(
        uint index,
        string name,
        uint age)
    {
        index = storageData[storeNum].indexInLi;
        name = storageData[storeNum].name;
        age = storageData[storeNum].age;
    }

}

// 101, "Valera", 26
// 102, "Tolik", 33
// 104, "Nikolai", 16
// 105, "Dimas", 18


contract callerCo{
    
    // get root account in constructor
    
    function UpdateStorage(address _root, uint storeNum, string name, uint age)
        public
        returns(bool Horaaaaaaay)
    {
        toTest T = toTest(_root);
        T.AddStore(storeNum, name, age);
        return true;
    }
}
