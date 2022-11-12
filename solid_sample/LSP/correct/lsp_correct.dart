abstract class MechanicalTestResult {
  void testResult();
}

abstract class SoftwareTestResult {
  void codingTestResult();
}

class MechanicalBranch implements MechanicalTestResult {
  @override
  void testResult() {
    // TODO: implement TestResult
  }
}

class ComputerScienceBranch extends SoftwareTestResult {
  @override
  codingTestResult() {
    //  some code
  }
}
