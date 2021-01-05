class SearchEngineBase(object):
    def __init__(self):
        pass
    #读文件，并将内容送到process_corpus方法中
    def add_corpus(self, file_path):
        with open(file_path, 'r') as fin:
            text = fin.read()
            self.process_corpus(file_path, text)
    #对内容进行处理，将处理后的文件存下来（索引）
    def process_corpus(self, id, text):
        raise Exception('process_corpus not implemented.')
    #处理询问，通过索引引擎返回
    def search(self, query):
        raise Exception('search not implemented.')

    def main(search_engine):
        for file_path in ['1.txt', '2.txt', '3.txt', '4.txt', '5.txt']:
            search_engine.add_corpus(file_path)
            while True:
                query = input()
                results = search_engine.search(query)
                print('found {} result(s):'.format(len(results)))
                for result in results:
                    print(result)

class SimpleEngine(SearchEngineBase):
    def __init__(self):
        #super 啥意思，为啥又使用 __init__()
        super(SimpleEngine, self).__init__()
        #为啥使用 __ 线
        self.__id_to_texts = {}
    def process_corpus(self, id, text):
        self.__id_to_texts[id] = text
    def search(self, query):
        results = []
        for id, text in self.__id_to_texts.items():
            if query in text:
                results.append(id)
        return results
search_engine = SimpleEngine()
search_engine.main()
