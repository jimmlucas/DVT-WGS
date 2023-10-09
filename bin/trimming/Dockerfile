FROM staphb/trimmomatic:latest

# Instalar Trimmomatic
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip && \
    unzip Trimmomatic-0.39.zip && \
    rm Trimmomatic-0.39.zip && \
    mv Trimmomatic-0.39/trimmomatic-0.39.jar /usr/local/bin/trimmomatic.jar && \
    chmod +x /usr/local/bin/trimmomatic.jar

# Establecer el comando predeterminado para Trimmomatic
ENTRYPOINT ["java", "-jar", "/usr/local/bin/trimmomatic.jar"]
