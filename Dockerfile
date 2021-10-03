FROM 085041388644.dkr.ecr.ap-northeast-1.amazonaws.com/rails-docker-image:0.0.15

# environment
ENV TZ='Asia/Tokyo'
ARG RAILS_ENV='production'
ENV RAILS_ENV ${RAILS_ENV}

# set workdir
WORKDIR /app

# application source code
COPY . /app

# rubygems
COPY Gemfile Gemfile.lock /app/
RUN bundle install --jobs=4 --retry=2

EXPOSE 1190
ENTRYPOINT ["/app/docker/scripts/docker-entrypoint.sh"]
