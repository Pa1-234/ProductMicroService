FROM python:3

ENV PYTHONUNBUFFERED 1
RUN mkdir /main
WORKDIR /main
COPY . /main/
RUN pip install -r requirements.txt

# Create a script to display a message and run the application
RUN echo '#!/bin/sh\n\
echo "Application is running!"\n\
exec "$@"' > run.sh

# Make the script executable
RUN chmod +x run.sh

# Expose port 8000
EXPOSE 8000

# Set the script as the final command to run when the container starts
CMD ["./run.sh"]
