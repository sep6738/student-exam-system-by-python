class HomeworkOrExamPool:
    def __init__(self, hepID=None, type=None, question=None, answer=None, courseName=None, difficultyLevel=None, knowledgePoint=None, isActive=None, kpID=None):
        self.hepID = hepID
        self.type = type
        self.question = question
        self.answer = answer
        self.courseName = courseName
        self.difficultyLevel = difficultyLevel
        self.knowledgePoint = knowledgePoint
        self.isActive = isActive
        self.kpID = kpID

    @property
    def hepID(self):
        return self._hepID

    @hepID.setter
    def hepID(self, value):
        self._hepID = value

    @property
    def type(self):
        return self._type

    @type.setter
    def type(self, value):
        self._type = value

    @property
    def question(self):
        return self._question

    @question.setter
    def question(self, value):
        self._question = value

    @property
    def answer(self):
        return self._answer

    @answer.setter
    def answer(self, value):
        self._answer = value

    @property
    def courseName(self):
        return self._courseName

    @courseName.setter
    def courseName(self, value):
        self._courseName = value

    @property
    def difficultyLevel(self):
        return self._difficultyLevel

    @difficultyLevel.setter
    def difficultyLevel(self, value):
        self._difficultyLevel = value

    @property
    def knowledgePoint(self):
        return self._knowledgePoint

    @knowledgePoint.setter
    def knowledgePoint(self, value):
        self._knowledgePoint = value

    @property
    def isActive(self):
        return self._isActive

    @isActive.setter
    def isActive(self, value):
        self._isActive = value

    @property
    def kpID(self):
        return self._kpID

    @kpID.setter
    def kpID(self, value):
        self._kpID = value