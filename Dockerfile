FROM amazoncorretto:8u202

WORKDIR /app

RUN groupadd -r -g 1000 app \
  && useradd -M -r -g app -u 1000 app \
  && yum update -y \
  && yum install -y tar graphviz \
  && curl -LO https://sourceforge.net/projects/plantuml-depend/files/1.4.0/plantuml-dependency-cli-1.4.0-archive-with-bundled-dependencies.tar.gz \
  && tar xzvf plantuml-dependency-cli-*.tar.gz \
  && rm plantuml-dependency-cli-*.tar.gz \
  && curl -LO https://sourceforge.net/projects/plantuml/files/1.2019.4/plantuml.1.2019.4.jar \
  && chown -R app:app /app

USER app

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
