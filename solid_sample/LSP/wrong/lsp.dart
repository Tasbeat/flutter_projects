abstract class Result {
  checkResult();

  codingTestResult();
}

class MechanicalBranch extends Result {
  @override
  checkResult() {
    // TODO: implement checkResult
    throw UnimplementedError();
  }

  @override
  codingTestResult() {
    // TODO: implement codingTestResult
    throw UnimplementedError();
  }
}

class ComputerScienceBranch extends Result {
  @override
  checkResult() {
    //  some codet
  }

  @override
  codingTestResult() {
    //  some code
  }
}
